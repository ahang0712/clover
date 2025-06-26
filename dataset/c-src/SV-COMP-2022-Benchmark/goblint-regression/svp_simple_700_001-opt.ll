; ModuleID = 'svp_simple_700_001-opt.bc'
source_filename = "./svp_simple_700_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = global i32 42, align 4
@h = global i32 42, align 4

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
define void @svp_simple_700_001_isr_1(i8* %0) #0 !dbg !20 {
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !21
  %3 = icmp sgt i32 %2, -1000, !dbg !22
  br i1 %3, label %4, label %6, !dbg !23

4:                                                ; preds = %1
  store i32 %2, i32* @g, align 4, !dbg !24, !tbaa !25
  %5 = sub nsw i32 %2, 17, !dbg !29
  store i32 %5, i32* @h, align 4, !dbg !30, !tbaa !25
  store i32 %2, i32* @h, align 4, !dbg !31, !tbaa !25
  br label %6, !dbg !32

6:                                                ; preds = %4, %1
  ret void, !dbg !33
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define void @svp_simple_700_001_isr_2(i8* %0) #0 !dbg !34 {
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !35
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !36
  %4 = load i32, i32* @g, align 4, !dbg !37, !tbaa !25
  %5 = load i32, i32* @h, align 4, !dbg !38, !tbaa !25
  %6 = icmp sle i32 %5, %4, !dbg !39
  %7 = zext i1 %6 to i32, !dbg !39
  br i1 %6, label %__VERIFIER_assert.exit, label %8, !dbg !40

8:                                                ; preds = %1
  %9 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !42
  call void @abort() #6, !dbg !44
  unreachable, !dbg !44

__VERIFIER_assert.exit:                           ; preds = %1
  ret void, !dbg !45
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_700_001_main() #0 !dbg !46 {
  %1 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !47
  %2 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !48
  %3 = load i32, i32* @g, align 4, !dbg !49, !tbaa !25
  %4 = load i32, i32* @h, align 4, !dbg !50, !tbaa !25
  %5 = icmp eq i32 %4, %3, !dbg !51
  %6 = zext i1 %5 to i32, !dbg !51
  br i1 %5, label %__VERIFIER_assert.exit, label %7, !dbg !52

7:                                                ; preds = %0
  %8 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !54
  call void @abort() #6, !dbg !56
  unreachable, !dbg !56

__VERIFIER_assert.exit:                           ; preds = %0
  %9 = icmp eq i32 %4, %3, !dbg !57
  %10 = zext i1 %9 to i32, !dbg !57
  br i1 %9, label %__VERIFIER_assert.exit1, label %11, !dbg !58

11:                                               ; preds = %__VERIFIER_assert.exit
  %12 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !60
  call void @abort() #6, !dbg !62
  unreachable, !dbg !62

__VERIFIER_assert.exit1:                          ; preds = %__VERIFIER_assert.exit
  ret i32 0, !dbg !63
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
!1 = !DIFile(filename: "svp_simple_700_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_700_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 3, column: 22, scope: !7)
!11 = !DILocation(line: 3, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 4, column: 40, scope: !12)
!14 = !DILocation(line: 4, column: 39, scope: !12)
!15 = !DILocation(line: 4, column: 48, scope: !12)
!16 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 4, column: 58, scope: !12)
!18 = !DILocation(line: 4, column: 72, scope: !12)
!19 = !DILocation(line: 4, column: 84, scope: !12)
!20 = distinct !DISubprogram(name: "svp_simple_700_001_isr_1", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 15, column: 11, scope: !20)
!22 = !DILocation(line: 16, column: 9, scope: !20)
!23 = !DILocation(line: 16, column: 7, scope: !20)
!24 = !DILocation(line: 17, column: 7, scope: !20)
!25 = !{!26, !26, i64 0}
!26 = !{!"int", !27, i64 0}
!27 = !{!"omnipotent char", !28, i64 0}
!28 = !{!"Simple C/C++ TBAA"}
!29 = !DILocation(line: 18, column: 11, scope: !20)
!30 = !DILocation(line: 18, column: 7, scope: !20)
!31 = !DILocation(line: 20, column: 7, scope: !20)
!32 = !DILocation(line: 22, column: 3, scope: !20)
!33 = !DILocation(line: 24, column: 1, scope: !20)
!34 = distinct !DISubprogram(name: "svp_simple_700_001_isr_2", scope: !8, file: !8, line: 26, type: !9, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 27, column: 11, scope: !34)
!36 = !DILocation(line: 28, column: 11, scope: !34)
!37 = !DILocation(line: 30, column: 7, scope: !34)
!38 = !DILocation(line: 31, column: 7, scope: !34)
!39 = !DILocation(line: 33, column: 23, scope: !34)
!40 = !DILocation(line: 4, column: 39, scope: !12, inlinedAt: !41)
!41 = distinct !DILocation(line: 33, column: 3, scope: !34)
!42 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !43)
!43 = distinct !DILocation(line: 4, column: 58, scope: !12, inlinedAt: !41)
!44 = !DILocation(line: 4, column: 72, scope: !12, inlinedAt: !41)
!45 = !DILocation(line: 35, column: 1, scope: !34)
!46 = distinct !DISubprogram(name: "svp_simple_700_001_main", scope: !8, file: !8, line: 48, type: !9, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 49, column: 11, scope: !46)
!48 = !DILocation(line: 50, column: 11, scope: !46)
!49 = !DILocation(line: 53, column: 7, scope: !46)
!50 = !DILocation(line: 54, column: 7, scope: !46)
!51 = !DILocation(line: 56, column: 23, scope: !46)
!52 = !DILocation(line: 4, column: 39, scope: !12, inlinedAt: !53)
!53 = distinct !DILocation(line: 56, column: 3, scope: !46)
!54 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !55)
!55 = distinct !DILocation(line: 4, column: 58, scope: !12, inlinedAt: !53)
!56 = !DILocation(line: 4, column: 72, scope: !12, inlinedAt: !53)
!57 = !DILocation(line: 58, column: 23, scope: !46)
!58 = !DILocation(line: 4, column: 39, scope: !12, inlinedAt: !59)
!59 = distinct !DILocation(line: 58, column: 3, scope: !46)
!60 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !61)
!61 = distinct !DILocation(line: 4, column: 58, scope: !12, inlinedAt: !59)
!62 = !DILocation(line: 4, column: 72, scope: !12, inlinedAt: !59)
!63 = !DILocation(line: 59, column: 3, scope: !46)
