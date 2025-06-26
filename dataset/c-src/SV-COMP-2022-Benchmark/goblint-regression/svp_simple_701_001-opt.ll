; ModuleID = 'svp_simple_701_001-opt.bc'
source_filename = "./svp_simple_701_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = global i32 0, align 4
@h = global i32 0, align 4
@i = global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
  %2 = icmp ne i32 %0, 0, !dbg !13
  br i1 %2, label %6, label %3, !dbg !14

3:                                                ; preds = %1
  br label %4, !dbg !15

4:                                                ; preds = %3
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !16
  call void @abort() #5, !dbg !18
  unreachable, !dbg !18

6:                                                ; preds = %1
  ret void, !dbg !19
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @svp_simple_701_001_isr_1(i8* %0) #0 !dbg !20 {
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !21
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !22
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !23
  %5 = icmp slt i32 %2, 1000, !dbg !24
  br i1 %5, label %6, label %23, !dbg !25

6:                                                ; preds = %1
  %7 = load i32, i32* @g, align 4, !dbg !26, !tbaa !27
  %8 = load i32, i32* @h, align 4, !dbg !31, !tbaa !27
  %9 = icmp sle i32 %8, %7, !dbg !32
  %10 = zext i1 %9 to i32, !dbg !32
  br i1 %9, label %__VERIFIER_assert.exit, label %11, !dbg !33

11:                                               ; preds = %6
  %12 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !35
  call void @abort() #6, !dbg !37
  unreachable, !dbg !37

__VERIFIER_assert.exit:                           ; preds = %6
  %13 = icmp eq i32 %7, %8, !dbg !38
  %14 = zext i1 %13 to i32, !dbg !38
  br i1 %13, label %__VERIFIER_assert.exit1, label %15, !dbg !39

15:                                               ; preds = %__VERIFIER_assert.exit
  %16 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !41
  call void @abort() #6, !dbg !43
  unreachable, !dbg !43

__VERIFIER_assert.exit1:                          ; preds = %__VERIFIER_assert.exit
  %17 = add nsw i32 %7, 31, !dbg !44
  store i32 %17, i32* @i, align 4, !dbg !45, !tbaa !27
  %18 = load i32, i32* @i, align 4, !dbg !46, !tbaa !27
  %19 = icmp sge i32 %18, %7, !dbg !47
  %20 = zext i1 %19 to i32, !dbg !47
  br i1 %19, label %__VERIFIER_assert.exit2, label %21, !dbg !48

21:                                               ; preds = %__VERIFIER_assert.exit1
  %22 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !50
  call void @abort() #6, !dbg !52
  unreachable, !dbg !52

__VERIFIER_assert.exit2:                          ; preds = %__VERIFIER_assert.exit1
  br label %23, !dbg !53

23:                                               ; preds = %__VERIFIER_assert.exit2, %1
  ret void, !dbg !54
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_701_001_main() #0 !dbg !55 {
  %1 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !56
  %2 = icmp sgt i32 %1, -1000, !dbg !57
  br i1 %2, label %3, label %5, !dbg !58

3:                                                ; preds = %0
  store i32 11, i32* @i, align 4, !dbg !59, !tbaa !27
  store i32 %1, i32* @g, align 4, !dbg !60, !tbaa !27
  %4 = sub nsw i32 %1, 17, !dbg !61
  store i32 %4, i32* @h, align 4, !dbg !62, !tbaa !27
  store i32 %1, i32* @h, align 4, !dbg !63, !tbaa !27
  store i32 3, i32* @i, align 4, !dbg !64, !tbaa !27
  br label %5, !dbg !65

5:                                                ; preds = %3, %0
  ret i32 0, !dbg !66
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_701_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_701_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 3, column: 40, scope: !12)
!14 = !DILocation(line: 3, column: 39, scope: !12)
!15 = !DILocation(line: 3, column: 48, scope: !12)
!16 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 3, column: 58, scope: !12)
!18 = !DILocation(line: 3, column: 72, scope: !12)
!19 = !DILocation(line: 3, column: 84, scope: !12)
!20 = distinct !DISubprogram(name: "svp_simple_701_001_isr_1", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 15, column: 11, scope: !20)
!22 = !DILocation(line: 16, column: 11, scope: !20)
!23 = !DILocation(line: 17, column: 11, scope: !20)
!24 = !DILocation(line: 18, column: 9, scope: !20)
!25 = !DILocation(line: 18, column: 7, scope: !20)
!26 = !DILocation(line: 19, column: 9, scope: !20)
!27 = !{!28, !28, i64 0}
!28 = !{!"int", !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C/C++ TBAA"}
!31 = !DILocation(line: 20, column: 9, scope: !20)
!32 = !DILocation(line: 21, column: 25, scope: !20)
!33 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !34)
!34 = distinct !DILocation(line: 21, column: 5, scope: !20)
!35 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !36)
!36 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !34)
!37 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !34)
!38 = !DILocation(line: 23, column: 25, scope: !20)
!39 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !40)
!40 = distinct !DILocation(line: 23, column: 5, scope: !20)
!41 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !42)
!42 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !40)
!43 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !40)
!44 = !DILocation(line: 25, column: 11, scope: !20)
!45 = !DILocation(line: 25, column: 7, scope: !20)
!46 = !DILocation(line: 26, column: 9, scope: !20)
!47 = !DILocation(line: 27, column: 25, scope: !20)
!48 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !49)
!49 = distinct !DILocation(line: 27, column: 5, scope: !20)
!50 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !51)
!51 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !49)
!52 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !49)
!53 = !DILocation(line: 29, column: 3, scope: !20)
!54 = !DILocation(line: 31, column: 1, scope: !20)
!55 = distinct !DISubprogram(name: "svp_simple_701_001_main", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 34, column: 11, scope: !55)
!57 = !DILocation(line: 35, column: 9, scope: !55)
!58 = !DILocation(line: 35, column: 7, scope: !55)
!59 = !DILocation(line: 37, column: 7, scope: !55)
!60 = !DILocation(line: 38, column: 7, scope: !55)
!61 = !DILocation(line: 39, column: 11, scope: !55)
!62 = !DILocation(line: 39, column: 7, scope: !55)
!63 = !DILocation(line: 41, column: 7, scope: !55)
!64 = !DILocation(line: 43, column: 7, scope: !55)
!65 = !DILocation(line: 45, column: 3, scope: !55)
!66 = !DILocation(line: 46, column: 3, scope: !55)
