; ModuleID = 'svp_simple_613_001-opt.bc'
source_filename = "./svp_simple_613_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@glob1 = global i32 0, align 4

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
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !16
  call void @abort() #4, !dbg !18
  unreachable, !dbg !18

6:                                                ; preds = %1
  ret void, !dbg !19
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @svp_simple_613_001_isr_1(i8* %0) #0 !dbg !20 {
  store i32 5, i32* @glob1, align 4, !dbg !21, !tbaa !22
  %2 = load i32, i32* @glob1, align 4, !dbg !26, !tbaa !22
  %3 = icmp eq i32 %2, 5, !dbg !27
  %4 = zext i1 %3 to i32, !dbg !27
  br i1 %3, label %__VERIFIER_assert.exit, label %5, !dbg !28

5:                                                ; preds = %1
  %6 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !30
  call void @abort() #5, !dbg !32
  unreachable, !dbg !32

__VERIFIER_assert.exit:                           ; preds = %1
  store i32 0, i32* @glob1, align 4, !dbg !33, !tbaa !22
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_613_001_main() #0 !dbg !35 {
  %1 = load i32, i32* @glob1, align 4, !dbg !36, !tbaa !22
  %2 = icmp eq i32 %1, 0, !dbg !37
  %3 = zext i1 %2 to i32, !dbg !37
  br i1 %2, label %__VERIFIER_assert.exit, label %4, !dbg !38

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !40
  call void @abort() #5, !dbg !42
  unreachable, !dbg !42

__VERIFIER_assert.exit:                           ; preds = %0
  %6 = load i32, i32* @glob1, align 4, !dbg !43, !tbaa !22
  %7 = icmp eq i32 %6, 0, !dbg !44
  %8 = zext i1 %7 to i32, !dbg !44
  br i1 %7, label %__VERIFIER_assert.exit1, label %9, !dbg !45

9:                                                ; preds = %__VERIFIER_assert.exit
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #3, !dbg !47
  call void @abort() #5, !dbg !49
  unreachable, !dbg !49

__VERIFIER_assert.exit1:                          ; preds = %__VERIFIER_assert.exit
  ret i32 0, !dbg !50
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_613_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_613_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
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
!20 = distinct !DISubprogram(name: "svp_simple_613_001_isr_1", scope: !8, file: !8, line: 9, type: !9, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 11, column: 9, scope: !20)
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C/C++ TBAA"}
!26 = !DILocation(line: 13, column: 21, scope: !20)
!27 = !DILocation(line: 13, column: 27, scope: !20)
!28 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !29)
!29 = distinct !DILocation(line: 13, column: 3, scope: !20)
!30 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !31)
!31 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !29)
!32 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !29)
!33 = !DILocation(line: 14, column: 9, scope: !20)
!34 = !DILocation(line: 16, column: 1, scope: !20)
!35 = distinct !DISubprogram(name: "svp_simple_613_001_main", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 20, column: 21, scope: !35)
!37 = !DILocation(line: 20, column: 27, scope: !35)
!38 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !39)
!39 = distinct !DILocation(line: 20, column: 3, scope: !35)
!40 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !41)
!41 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !39)
!42 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !39)
!43 = !DILocation(line: 22, column: 21, scope: !35)
!44 = !DILocation(line: 22, column: 27, scope: !35)
!45 = !DILocation(line: 3, column: 39, scope: !12, inlinedAt: !46)
!46 = distinct !DILocation(line: 22, column: 3, scope: !35)
!47 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !48)
!48 = distinct !DILocation(line: 3, column: 58, scope: !12, inlinedAt: !46)
!49 = !DILocation(line: 3, column: 72, scope: !12, inlinedAt: !46)
!50 = !DILocation(line: 24, column: 3, scope: !35)
