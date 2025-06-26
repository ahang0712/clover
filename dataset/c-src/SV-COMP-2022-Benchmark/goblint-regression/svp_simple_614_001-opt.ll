; ModuleID = 'svp_simple_614_001-opt.bc'
source_filename = "./svp_simple_614_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g1 = common global i32 0, align 4
@g2 = common global i32 0, align 4

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
define void @svp_simple_614_001_isr_1(i8* %0) #0 !dbg !20 {
  %2 = load i32, i32* @g1, align 4, !dbg !21, !tbaa !22
  %3 = add nsw i32 %2, 1, !dbg !26
  store i32 %3, i32* @g1, align 4, !dbg !27, !tbaa !22
  %4 = load i32, i32* @g1, align 4, !dbg !28, !tbaa !22
  %5 = sub nsw i32 %4, 1, !dbg !29
  store i32 %5, i32* @g1, align 4, !dbg !30, !tbaa !22
  %6 = load i32, i32* @g2, align 4, !dbg !31, !tbaa !22
  %7 = add nsw i32 %6, 1, !dbg !32
  store i32 %7, i32* @g2, align 4, !dbg !33, !tbaa !22
  %8 = load i32, i32* @g2, align 4, !dbg !34, !tbaa !22
  %9 = sub nsw i32 %8, 1, !dbg !35
  store i32 %9, i32* @g2, align 4, !dbg !36, !tbaa !22
  ret void, !dbg !37
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_614_001_main() #0 !dbg !38 {
  %1 = load i32, i32* @g1, align 4, !dbg !39, !tbaa !22
  %2 = icmp eq i32 %1, 0, !dbg !40
  %3 = zext i1 %2 to i32, !dbg !40
  br i1 %2, label %__VERIFIER_assert.exit, label %4, !dbg !41

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !43
  call void @abort() #6, !dbg !45
  unreachable, !dbg !45

__VERIFIER_assert.exit:                           ; preds = %0
  %6 = load i32, i32* @g1, align 4, !dbg !46, !tbaa !22
  %7 = icmp eq i32 %6, 0, !dbg !47
  %8 = zext i1 %7 to i32, !dbg !47
  br i1 %7, label %__VERIFIER_assert.exit1, label %9, !dbg !48

9:                                                ; preds = %__VERIFIER_assert.exit
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !50
  call void @abort() #6, !dbg !52
  unreachable, !dbg !52

__VERIFIER_assert.exit1:                          ; preds = %__VERIFIER_assert.exit
  %11 = load i32, i32* @g2, align 4, !dbg !53, !tbaa !22
  %12 = icmp eq i32 %11, 0, !dbg !54
  %13 = zext i1 %12 to i32, !dbg !54
  br i1 %12, label %__VERIFIER_assert.exit2, label %14, !dbg !55

14:                                               ; preds = %__VERIFIER_assert.exit1
  %15 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !57
  call void @abort() #6, !dbg !59
  unreachable, !dbg !59

__VERIFIER_assert.exit2:                          ; preds = %__VERIFIER_assert.exit1
  %16 = load i32, i32* @g1, align 4, !dbg !60, !tbaa !22
  %17 = icmp eq i32 %16, 0, !dbg !61
  %18 = zext i1 %17 to i32, !dbg !61
  br i1 %17, label %__VERIFIER_assert.exit3, label %19, !dbg !62

19:                                               ; preds = %__VERIFIER_assert.exit2
  %20 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !64
  call void @abort() #6, !dbg !66
  unreachable, !dbg !66

__VERIFIER_assert.exit3:                          ; preds = %__VERIFIER_assert.exit2
  ret i32 0, !dbg !67
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
!1 = !DIFile(filename: "svp_simple_614_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_614_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
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
!20 = distinct !DISubprogram(name: "svp_simple_614_001_isr_1", scope: !8, file: !8, line: 7, type: !9, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 9, column: 14, scope: !20)
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C/C++ TBAA"}
!26 = !DILocation(line: 9, column: 17, scope: !20)
!27 = !DILocation(line: 10, column: 6, scope: !20)
!28 = !DILocation(line: 13, column: 14, scope: !20)
!29 = !DILocation(line: 13, column: 17, scope: !20)
!30 = !DILocation(line: 14, column: 6, scope: !20)
!31 = !DILocation(line: 17, column: 14, scope: !20)
!32 = !DILocation(line: 17, column: 17, scope: !20)
!33 = !DILocation(line: 18, column: 6, scope: !20)
!34 = !DILocation(line: 21, column: 14, scope: !20)
!35 = !DILocation(line: 21, column: 17, scope: !20)
!36 = !DILocation(line: 22, column: 6, scope: !20)
!37 = !DILocation(line: 24, column: 1, scope: !20)
!38 = distinct !DISubprogram(name: "svp_simple_614_001_main", scope: !8, file: !8, line: 26, type: !9, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 29, column: 21, scope: !38)
!40 = !DILocation(line: 29, column: 24, scope: !38)
!41 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !42)
!42 = distinct !DILocation(line: 29, column: 3, scope: !38)
!43 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !44)
!44 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !42)
!45 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !42)
!46 = !DILocation(line: 31, column: 21, scope: !38)
!47 = !DILocation(line: 31, column: 24, scope: !38)
!48 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !49)
!49 = distinct !DILocation(line: 31, column: 3, scope: !38)
!50 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !51)
!51 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !49)
!52 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !49)
!53 = !DILocation(line: 33, column: 21, scope: !38)
!54 = !DILocation(line: 33, column: 24, scope: !38)
!55 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !56)
!56 = distinct !DILocation(line: 33, column: 3, scope: !38)
!57 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !58)
!58 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !56)
!59 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !56)
!60 = !DILocation(line: 35, column: 21, scope: !38)
!61 = !DILocation(line: 35, column: 24, scope: !38)
!62 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !63)
!63 = distinct !DILocation(line: 35, column: 3, scope: !38)
!64 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !65)
!65 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !63)
!66 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !63)
!67 = !DILocation(line: 37, column: 3, scope: !38)
